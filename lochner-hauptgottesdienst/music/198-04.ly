\version "2.24.3"
% Scan 198, printed p. 173: Credo C, Gemeinde, Apostolicum.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \key d \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne a'2 fis'4 g'4 \bar "|" a'1 \bar "|" b'2 a'2 \bar "|"
          fis'4 g'4. e'4 e'4 \bar "|"
          \once \override NoteColumn.force-hshift = #-0.6 d'1\fermata }
        \new Voice { \voiceTwo fis'2 d'4 d'4 d'1 d'2 d'2
          d'4 d'4 s8 d'4 cis'4
          \once \override NoteColumn.force-hshift = #0.6 d'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Ich glaub an Gott "Va :" "ter," den "All :" "mäch :" "ti : :" "gen."
      }
      \new Staff <<
        \clef bass \key d \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne d'2 a4 b4 a1 g2 fis2 a4 b4 s8 a4 a4 fis1 }
        \new Voice { \voiceTwo d2 d4 g4 fis1 s2 d2 d4 g,4 s8 a,4 a,4 b,1_\fermata }
      >>
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
