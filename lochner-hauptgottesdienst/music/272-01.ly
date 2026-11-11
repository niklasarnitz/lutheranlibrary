\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 272, printed p. 247.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { a'1 a'1 g'1 a'\breve \bar "|" bes'\breve a'1 g'1 g'1 g'\breve a'\breve \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t Zu -- komm dein "Reich." Dein Wil -- le ge -- sche -- "he," wie im Him -- "mel," al -- so }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 <c' e' g'>1 <c' f' a'>\breve \bar "|" <d' e' f' bes'>\breve <c' f' a'>1 r1 r1 <c' d' f' g'>\breve <c' f' a'>\breve \bar "|" r1 r1 r1 r1 r1 r1 }
      \new Staff { \clef bass \global r1 r1 c1 f\breve \bar "|" bes,\breve f1 r1 r1 c\breve f\breve \bar "|" r1 r1 r1 r1 r1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
