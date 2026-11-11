\version "2.24.3"
% Scan 177, printed p. 152: Amen zu den Collecten, Nr. 5.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "sung" { \voiceOne f'1( g'1) \once \override NoteColumn.force-hshift = #-0.6 f'\breve \bar "|." }
      \new Voice { \voiceTwo c'2( d'2 e'1) \once \override NoteColumn.force-hshift = #0.6 f'\breve }
    >>
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t "A : : : :" \skip 1 "men."
    }
    \new Staff <<
      \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne a1( c'1) a\breve }
      \new Voice { \voiceTwo f2( d2 c1) f\breve }
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
